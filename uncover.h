#ifndef UNCOVER_H
#define UNCOVER_H

#include <QObject>
#include <QVariantList>

class Uncover : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString fileSource READ fileSource WRITE setFileSource NOTIFY fileSourceChanged)
    Q_PROPERTY(int punti READ punti NOTIFY puntiChanged)
    Q_PROPERTY(int countdown READ countdown NOTIFY countdownChanged)

public:

    Uncover(const QString& filename);

    void setFileSource(const QString& aFile);
    QString fileSource() const { return m_fileSource; }
    int punti() const { return m_punti; }
    int countdown() const { return m_countdown; }

    void randomizer();

public slots:
    void change();
    void chooseTile();
    void allTiles();
    void tick();

signals:
    void countdownChanged();
    void puntiChanged();
    void fileSourceChanged();
    void tileChanged(int rectNumber);
    void showAll();

private:
    QList<QString> m_fileNames;
    QString m_fileSource;
    int m_estrazioni;

    int m_tile;
    QList<int> m_tileList;

    QList<QList<int> > m_orders;
    int m_punti;

    int m_countdown;
};

#endif // UNCOVER_H
