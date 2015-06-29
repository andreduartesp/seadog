#include "qfilewriter.h"
#include <QtQuick/QQuickView>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    //qmlRegisterType<QFileWriter>("QFileWriter", 1, 0, "QFileWriter");

    QFileWriter fileWriter;
    QQmlApplicationEngine engine;
    QQmlContext* ctx = engine.rootContext();
    ctx->setContextProperty("fileWriter", &fileWriter);

    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));
    return app.exec();
}
