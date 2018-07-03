#include "uncover.h"

#include <QGuiApplication>

#include <QFile>
#include <QTextStream>
#include <QStringList>
#include <QDebug>

#include <algorithm>
#include <random>
#include <chrono>
#include <unistd.h>

//unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
#define NUMBER_OF_TILES 4
#define SEED            std::chrono::system_clock::now().time_since_epoch().count()
#define MAX_PUNTI       8
#define COUNTDOWN_TIME  10

Uncover::Uncover(const QString& filename) :
    m_fileSource(QString("")),
    m_estrazioni(0),
    m_tile(0),
    m_punti(MAX_PUNTI),
    m_countdown(COUNTDOWN_TIME)
{
    QFile file(filename);

    if (file.open(QIODevice::ReadOnly)) {
        QTextStream stream(&file);

        while (!stream.atEnd()) {
            QString line = stream.readLine();
            if (line == "")
                continue;

            QStringList items = line.split(",");
            QList<int> list;
            if (items.size() > 1) {
                for (int i=1; i<NUMBER_OF_TILES+1; i++)
                    list.append(items.at(i).toInt()-1);
            } else {
                for (int i=0; i<NUMBER_OF_TILES; i++)
                    list.append(i);
                unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
                std::shuffle(list.begin(), list.end(), std::default_random_engine(seed));
            }
            qDebug() << list;
            m_orders.append(list);

            m_fileNames.append(items.at(0).trimmed());
        }

        file.close();

        //randomizer();
        //change();

        setFileSource(m_fileNames.at(m_estrazioni));
        m_tileList = m_orders.at(m_estrazioni);
    }
}

void Uncover::setFileSource(const QString& e)
{
    m_fileSource = e;
    emit fileSourceChanged();
}

void Uncover::tick()
{
    m_countdown--;

    if (m_countdown < 0) {
        chooseTile();
        m_countdown = COUNTDOWN_TIME;
    }
    emit countdownChanged();
}

void Uncover::change()
{
    m_estrazioni++;
    if (m_estrazioni == m_fileNames.count()) {
        qDebug() << "IMMAGINI TERMINATE";
        qApp->quit();
    }
    else {
        m_punti = MAX_PUNTI;
        emit puntiChanged();
        m_tile = 0;
        m_tileList = m_orders.at(m_estrazioni);
        setFileSource(m_fileNames.at(m_estrazioni));
        //chooseTile();
        m_countdown = COUNTDOWN_TIME;
        emit countdownChanged();
    }
}

void Uncover::chooseTile()
{
    if (m_tile == NUMBER_OF_TILES) {
        qDebug() << "TILE TUTTI SCOPERTI";
        return;
    }

    m_punti--;
    emit puntiChanged();
    emit tileChanged(m_tileList.at(m_tile));

    m_tile++;
}

void Uncover::randomizer()
{
    unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
    std::shuffle(m_fileNames.begin(), m_fileNames.end(), std::default_random_engine(seed));
}

void Uncover::allTiles()
{
    emit showAll();
    m_countdown = COUNTDOWN_TIME;
}
