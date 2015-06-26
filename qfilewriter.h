#ifndef QFILEWRITER_H
#define QFILEWRITER_H

#include <QtCore>
#include <QString>

class QFileWriter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString content READ getContent WRITE setContent)
public:
    explicit QFileWriter(QObject *parent = 0);
    QString getContent() const;
    void setContent(const QString &content);
public slots:
    void writeFile();
private:
    QString content;
};

#endif // QFILEWRITER_H
