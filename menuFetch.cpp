#include "menuFetch.h"
#include <QNetworkReply>

Menufetch::Menufetch(QObject* parent) :
    QObject (parent)
{
    this->data_ = "World";
    //QTextStream(stdout) << "Working";
}

void Menufetch::get(QString id)
{
    //QTextStream(stdout) << "Here";
    QUrl url("https://pokeapi.co/api/v2/pokemon/"+id);
    QNetworkRequest request;
    request.setUrl(url);
    QNetworkReply* currentReply = networkManager.get(request);
    (void)currentReply;
    connect(&networkManager, &QNetworkAccessManager::finished, this, &Menufetch::onResult);
}

QString Menufetch::data()
{
    return data_;
}

void Menufetch::setData(QString data)
{
//    QTextStream(stdout) << data;
    this->get(data);
}

void Menufetch::onResult(QNetworkReply* net)
{
    //QTextStream(stdout) << "Emit";
    data_ = static_cast<QString>(net->readAll());
    emit dataChanged();
//    emit result(static_cast<QString>(net->readAll()));
}
