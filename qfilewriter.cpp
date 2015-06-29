#include "qfilewriter.h"
#include <sstream>
#include <string>
#include <iostream>
#include <QDesktopServices>

QFileWriter::QFileWriter(QObject *parent) : QObject(parent)
{
    this->content = QStringList();
    this->atualFile = 0;
    this->fileName = "Data.txt";
    QFile file(this->fileName);
    if(file.open(QIODevice::ReadOnly))
    {
        QTextStream in(&file);
        while (!in.atEnd())
        {
            QString line = in.readLine();
            QStringList splitedLine = line.split(';');
            ++this->atualFile;
            this->content.insert(this->atualFile, splitedLine[1]);
        }
        file.close();
    }
}

int QFileWriter::getAtualFile()
{
    return this->atualFile;
}

void QFileWriter::setAtualFile(int value)
{
    this->atualFile = value;
}

int QFileWriter::getFolderSize()
{
    return this->folderSize;
}

void QFileWriter::setFolderSize(int value)
{
    this->folderSize = value;
}

void QFileWriter::writeFile()
{
    QFile file(this->fileName);
    if(file.open(QIODevice::ReadWrite | QIODevice::Truncate | QIODevice::Text))
    {

        for(int i = 0; i < this->content.count(); ++i)
        {
            std::ostringstream ss;
            ss << i;
            file.write(ss.str().c_str());
            file.write(";");
            file.write(this->content[i].toStdString().c_str());
            file.write("\n");
        }
        file.close();
    }
}

void QFileWriter::addVote(const QString &value)
{
    if(this->atualFile >= this->content.count())
    {
        this->content.insert(this->atualFile, value);
    }
    else
    {
        this->content[this->content.count()] = value;
    }
    ++this->atualFile;
    this->changeFile();
    this->writeFile();
}

void QFileWriter::backFile()
{
    if(this->atualFile > 0)
    {
        --this->atualFile;
        this->content.removeAt(this->atualFile);
    }
    this->changeFile();
    this->writeFile();
}

void QFileWriter::sendEmail()
{
    std::ostringstream ss;
    ss << "mailto:andreduartesp@gmail.com?subject=Estudo de Cores&body=";
    for(int i = 0; i < this->content.count(); ++i)
    {
        ss << i << ";" << this->content[i].toStdString() << "\n";
    }

    QDesktopServices::openUrl(QUrl(ss.str().c_str()));
}
