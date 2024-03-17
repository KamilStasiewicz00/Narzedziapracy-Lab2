#!/bin/bash


if [ $# -eq 0 ]; then
    read -p "Podaj nazwę pliku: " filename
else
    filename=$1
fi

if [ ! -f $filename ]; then
    echo "Błąd: Plik $filename nie istnieje."
    exit 1
fi

if [ ! -f zad1.sh ]; then
    echo "Błąd: Plik zad1.sh nie istnieje."
    exit 1
fi

if [[ ":$PATH:" != *":$(pwd):"* ]]; then
    export PATH="$PATH:$(pwd)"
    echo "Ścieżka do skryptu została dodana do zmiennej PATH."
fi

dir="daneUsera"
mkdir -p "$dir"
mv "$filename" "$dir/$filename"

ls -l >> "$new_dir/$filename"

echo "Operacja zakończona."