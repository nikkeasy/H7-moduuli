# Palvelinten-hallinta
Palvelinten hallinta 2020 Syksy/ ict4tn022-3010 - kurssin Harjoitustyö 

Tässä harjoitustyössä on tarkoitus automatisoiden asentaa ohjelmia ja niihin liittyviä asetuksia, käyttäjiä, käyttäjäryhmiä sekä
samoin myös poistaa asetustiedostoja <b>Saltilla</b> 

Kaikki konfiguroinnit, asennukset ja tarkemmat selitykset ovat kuvattuna blogipostauksessani: "https://linuxwithkunnas.wordpress.com/2020/12/17/viikko-7-moduuli-harjoitustyo/"

Tämän repositoryn avulla Saltin master-slave -arkkitehtuuria hyödyntäen voit: 

- Asentaa <b> Blenderin, Filezillan ja Libreofficen
- Luoda mukautetut asetustiedostot näihin em. ohjelmiin
  - Parhaiten toimii FileZillassa, johon on tallennettu kirjautumistiedot master-koneen FTP-serverille (vsftpd) 
- Lisätä käyttäjäryhmän ja käyttäjiä (3 kpl)
- Poistaa luodut käyttäjät
- Poistaa uusia käyttäjiä koskevat asetukset (jotka sijaitsevat /etc/skel -kansiossa) 
  
  Miten tätä ajetaan? : 
  
  Tilojen ajaminen edellyttää salt minion-servicen asennusta, mikäli haluaa ajaa tilat lokaalisti yhdelle koneelle. 
  Mikäli haluat hyödyntää master -slave arkkitehtuuria tulee sinun asentaa salt minion ja salt master (ks. asennusohjeet täältä: http://terokarvinen.com/2018/salt-quickstart-salt-stack-master-and-slave-on-ubuntu-linux/)
  
  -Mikäli haluat hyödyntää FileZillan asetuksia omiin tarkoituksiin (nykyiset, itselle asetetut ip:t ja käyttäjät eivät tule tietenkään toimimaan sinulla) tulee sinun käynnistää Filezilla ja valita <b> File </b> ja sieltä <b> Site Manager </b>, josta voit luoda omat asetuksesi valmiiksi. Tämän jälkeen voit kopioida sitemanager.xml -tiedoston /home/<nykyinen käyttäjä>/.config/filezilla -hakemistosta. 
  
Voit toki tehdä suoraan muutoksia sitemanager.xml -tiedostoon, mutta helpommalla pääset kun konffaat ne GUI:n kautta. 
  
Suosittelen myös lataamaan ja konffaamaan vsftpd - ftp-serverin tai vastaaman ja luomaan siihen tarvittavat asetukset. 
 
Yleisesti ottaen toiimi näin: 
  
  - Konfiguroi master ja slave toimintakuntoon. 
  - Kloonaa tämä repository
  - Suorita top.sls -tila (wipeusers ja wipeskel eli käyttäjiä ja asetustiedostoja poistavat tilat kommentoitu pois - eivät toimi oletuksena) 
  - ??? 
  - Profit
  
  
  
Millaisessa esimerkkitilanteessa tätä voisi käyttää? 

Vaikkapa asentaessa työympäristöön koneita, joiden kaikkien pitää saada vaivattomasti pääsy ftp-palvelimelle ilman erillisten salasanojen ja käyttäjätunnusten luomista. Käytännössä tiloja voi skaalata paljon suuremmiksi, nythän ne koskevat vain muutamaa käyttäjää, mutta mikä estää luomasta satoja tai jopa tuhansia käyttäjiä, asetuksia, sovelluksia tms. eri koneille.

En saanut tästä 'täydellistä' ja kehitettävää on mm. : 
- Tietoturvassa (FTP ei ole turvallinen ja tarkoitus oli luoda pääsy sftp-palvelimelle - ei ftp-palvelimelle) 
- Libreofficen ja Blenderin asetustiedostojen muokkaamisessa ja niiden toimintaan saamisessa
- Raportoinnin pituudessa ":D" -> Tuntuu, että loin liian pitkän raportin wordpressiin, vaikka "Kaikki vaiheet tulisi dokumentoida"

Jatkokehitettävää: 
  - svftpd asennus orjakoneille. Tarvittaessa top.sls -tiedostoa voisi muokata siten, että se sisältäisi svftd:n asennukseen liittyvät tilat ja konfiguroinnit, mikäli on tarvetta ftp-serverille orjakoneella.
  - Lisää hyödyllisiä toiminnallisuuksia
  - Käyttäjäkohtaisten asetustiedostojen saaminen jo olemassa oleville käyttäjille 



