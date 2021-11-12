# 2.

Aby zbudować opracowany obraz i nazwać go lab4docker należy wykorzystać polecenie ```docker build . -t lab4docker```.

# 3.

Aby utworzyć wolumen o nazwie LocalVol (lokalnie na maszynie wirtualnej) należy wykorzystać polecenie ```docker volume create LocalVol```.

# 4. 

Aby uruchomić kontener o nazwie alpine4 na bazie zbudowanego obrazu lab4docker z podłączonym do niego wolumenem LocalVol (lokalnie na maszynie wirtualnej) w miejsce katalogu /logi w systemie plików kontenera oraz z ograniczeniem ilości wykorzystywanej pamięci RAM do 512MB należy wykorzystać polecenie ```docker run -it --name alpine4 --memory=512m --mount source=LocalVol,target=/logi lab4docker```.

# 5.

a. Aby sprawdzić czy skrypt pluto.sh generuje wymagane dane i umieszcza je w pliku info.log na wolumenie, który znajduje lokalnie na maszynie wirtualnej (dlatego nie użyto polecenia docker plugin) należy utworzyć kontener pomocniczy z podmotowanym wyżej wymienionym wolumenem wykorzystując polecenie ```docker run -it --name test --mount source=LocalVol,target=/logi alpine```, a następnie wywołać na nim polecenia ```ls -al logi``` i ```cat logi/info.log```.

b. Aby sprawdzić czy kontener alpine4 ma ograniczoną ilość pamięci RAM należy wykorzystać polecenie ```docker stats --no-stream --format {{.MemUsage}} alpine4```. (Uruchomiono wcześniej kontener z edytowany skryptem pluto.sh, sprawiającym, że kontener nie zamyka się, aby móc użyć polecenia docker stats. (Edytowany skrypt pluto.sh znajduje się w repozytorium pod nazwą pluto-test.sh.))

# 6.

Aby skorzystać z narzędzia cAdvisor w celu uzyskania informacji o kontenerze należy wykorzystać polecenie
```docker run --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --publish=8080:8080 --detach=true --name=cadvisor google/cadvisor:latest```, wejść przez przeglądarkę na ```localhost:8080```, przejść do ```Docker Containers``` i wybrać kontener alpine4. (Uruchomiono wcześniej kontener z edytowany skryptem pluto.sh, sprawiającym, że kontener nie zamyka się, aby móc użyć narzędzia cAdvisor. (Edytowany skrypt pluto.sh znajduje się w repozytorium pod nazwą pluto-test.sh.))
