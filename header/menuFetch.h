#ifndef FETCH_H
#define FETCH_H
#include <QNetworkAccessManager>

class Menufetch : public QObject
{
    Q_OBJECT
    QString data_;
    Q_PROPERTY(QString data READ data WRITE setData NOTIFY dataChanged)

    QNetworkAccessManager networkManager;
public:
    Menufetch(QObject* parent=nullptr);
    void get(QString id);
    QString data();
    void setData(QString data);

public slots:
    void onResult(QNetworkReply *net);

signals:
    void dataChanged();

};

#endif // FETCH_H
