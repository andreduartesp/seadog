#include "qfilewriter.h"

QFileWriter::QFileWriter(QObject *parent) : QObject(parent)
{
    this->content = "";
}

QString QFileWriter::getContent() const
{
    return this->content;
}

void QFileWriter::setContent(const QString &content)
{
    this->content = content;
}

void QFileWriter::writeFile()
{
    QString filename = "/sdcard/Data.txt";
    QFile file(filename);
    if(file.open(QIODevice::ReadWrite))
    {
        file.write((this->content + "\n").toStdString().c_str());
        file.close();
    }
}
