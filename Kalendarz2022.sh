#!/bin/bash

zapytaj_o_informacje() {
    read -p "$1: " wartosc
    echo "$wartosc"
}

touch plik1.txt
touch plik2.txt

day=$1
month=$2

if [ -z "$day" ]; then
    day=$(zapytaj_o_informacje "Podaj numer dnia tygodnia (1-7)")
fi

if [ -z "$month" ]; then
    month=$(zapytaj_o_informacje "Podaj numer miesiąca (1-12)")
fi


if ! [[ "$day" =~ ^[0-9]+$ ]] || ! [[ "$month" =~ ^[0-9]+$ ]]; then
    echo "Błąd: Podano niepoprawne wartości dla numeru dnia lub miesiąca."
    echo "Błąd: Podaj numery jako liczby całkowite."
    exit 1
fi


day_of_week=$(date -d "$month/$day/2022" +"%A" 2> /dev/null)


if [ $? -eq 0 ]; then
    echo "Dzień tygodnia: $day_of_week"
    echo "Dzień tygodnia: $day_of_week" >> plik1.txt
else
    echo "Błąd: Wyznaczenie dnia tygodnia nie powiodło się."
    echo "Błąd: Wyznaczenie dnia tygodnia nie powiodło się." >> plik2.txt
fi