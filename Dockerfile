# Wybor obrazu bazowego
FROM alpine

# Podpis
LABEL author="Blazej Typek"

# Utworzenie folderu roboczego
WORKDIR /usr/src/app

# Podlaczenie wolumenu
VOLUME [ "/logi" ]

# Kopiowanie skryptu na obraz
COPY pluto.sh pluto.sh

# Wywolanie skryptu przy starcie kontenera
ENTRYPOINT [ "./pluto.sh" ]