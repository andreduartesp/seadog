#include "qfilewriter.h"

QFileWriter::QFileWriter(QObject *parent) : QObject(parent)
{

}

QString QFileWriter::content() const
{
    return this->value;
}

void QFileWriter::setContent(const QString &value)
{
    this->value = value;
}

void QFileWriter::writeFile()
{
    QString filename = "/sdcard/Data.txt";
    QFile file(filename);
    if(file.open(QIODevice::ReadWrite))
    {
        file.write((this->value + "\n").toStdString().c_str());
        file.close();
    }
}
