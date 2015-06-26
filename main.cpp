#include "qfilewriter.h"
#include <QtQuick/QQuickView>
#include <QApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    qmlRegisterType<QFileWriter>("QFileWriter", 1, 0, "QFileWriter");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));
    return app.exec();
}
