#!/bin/bash

silnia_rekurencyjnie() {
    if [ "$1" -eq 0 ]; then
        echo 1
    else
        local n="$1"
        local wynik=1
        while [ "$n" -gt 1 ]; do
            wynik=$((wynik * n))
            n=$((n - 1))
        done
        echo "$wynik"
    fi
}


silnia_petla() {
    local n="$1"
    local wynik=1
    while [ "$n" -gt 1 ]; do
        wynik=$((wynik * n))
        n=$((n - 1))
    done
    echo "$wynik"
}


imie="$1"
nazwisko="$2"
rok_urodzenia="$3"
plik_danych="$4"


zapytaj_o_informacje() {
    read -p "$1: " wartosc
    echo "$wartosc"
}


if [ -z "$imie" ]; then
    imie=$(zapytaj_o_informacje "Podaj swoje imię")
fi

if [ -z "$nazwisko" ]; then
    nazwisko=$(zapytaj_o_informacje "Podaj swoje nazwisko")
fi

if [ -z "$rok_urodzenia" ]; then
    rok_urodzenia=$(zapytaj_o_informacje "Podaj swój rok urodzenia")
fi

if [ -z "$plik_danych" ]; then
    plik_danych="daneUsera.txt"
fi

aktualny_rok=$(date +%Y)
wiek=$((aktualny_rok - rok_urodzenia))


silnia_rek=$(silnia_rekurencyjnie "$wiek")
silnia_pet=$(silnia_petla "$wiek")


echo "Witaj, $imie $nazwisko!"
echo "Masz $wiek lat."


echo "$imie, $nazwisko, $rok_urodzenia, $wiek, $silnia_rek, $silnia_pet" > "$plik_danych"
echo "Informacje zostały zapisane do pliku $plik_danych."