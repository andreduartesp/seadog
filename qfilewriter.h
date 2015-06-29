#ifndef QFILEWRITER_H
#define QFILEWRITER_H

#include <QtCore>
#include <QString>

class QFileWriter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int atualFile READ getAtualFile WRITE setAtualFile)
    Q_PROPERTY(int folderSize READ getFolderSize WRITE setFolderSize)
public:
    explicit QFileWriter(QObject *parent = 0);
    int getAtualFile();
    void setAtualFile(int value);
    int getFolderSize();
    void setFolderSize(int value);
public slots:
    void addVote(const QString &content);
    void backFile();
    void sendEmail();
signals:
    void changeFile();
private:
    QStringList content;
    int atualFile;
    int folderSize;
    QString fileName;
    void writeFile();
};

#endif // QFILEWRITER_H
