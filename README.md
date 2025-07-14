# JAVA_HOME Auto-Setter Bash Script

Dieses Bash-Skript setzt automatisch die Umgebungsvariable `JAVA_HOME`, falls sie noch nicht gesetzt ist, und sorgt dafür, dass die gewünschte Java-Version im `PATH` steht.

## Inhalt

- [Über das Skript](#über-das-skript)
- [Installation & Nutzung](#installation--nutzung)
- [Funktionsweise](#funktionsweise)
- [Verwaltung mehrerer Java-Versionen](#verwaltung-mehrerer-java-versionen)
  - [Interaktive Auswahl](#interaktive-auswahl)
  - [Nicht-interaktive Auswahl](#nicht-interaktive-auswahl)
- [Beispielausgabe](#beispielausgabe)
- [Fehlerbehandlung & Hinweise](#fehlerbehandlung--hinweise)
- [Lizenz](#lizenz)

## Über das Skript

Das Skript prüft, ob die Umgebungsvariable `JAVA_HOME` gesetzt ist. Falls nicht, wird automatisch versucht, den Installationspfad von Java zu erkennen und die Variable zu setzen. Zusätzlich wird `$JAVA_HOME/bin` ans Ende des `PATH` angehängt, nachdem vorherige Java-Pfade entfernt wurden, damit immer die gewünschte Java-Version verwendet wird.

## Installation & Nutzung

1. **Skript herunterladen**  
   Lade das Skript herunter und mache es ausführbar:
chmod +x set_java_home.sh


2. **Skript ausführen**
./set_java_home.sh

Nach der Ausführung ist die Variable `JAVA_HOME` gesetzt und der `PATH` angepasst (sofern Java installiert ist).

3. **In die Shell einbinden (optional)**  
Um das Skript automatisch beim Start einer Shell auszuführen, füge es in deine `.bashrc` oder `.profile` ein:
source /pfad/zu/set_java_home.sh


## Funktionsweise

- Prüft, ob `JAVA_HOME` gesetzt ist.
- Sucht den Pfad zur `java`-Binärdatei.
- Geht drei Verzeichnisse nach oben, um das Java-Home-Verzeichnis zu bestimmen.
- Setzt `JAVA_HOME` nur, wenn das Verzeichnis existiert.
- Entfernt alle bisherigen Java-Pfade aus dem `PATH` und hängt `$JAVA_HOME/bin` an.

## Verwaltung mehrerer Java-Versionen

Auf Systemen mit mehreren Java-Versionen kannst du mit den folgenden Befehlen die Standard-Java-Version festlegen.

### Interaktive Auswahl

Wähle die gewünschte Java-Version aus einer Liste:
sudo update-alternatives --config java
sudo update-alternatives --config javac


### Nicht-interaktive Auswahl

Alle verfügbaren Java-Versionen anzeigen:
sudo update-java-alternatives --list

Eine bestimmte Version setzen (Beispiel für OpenJDK 11):
sudo update-alternatives --set java /usr/lib/jvm/java-11-openjdk-amd64/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/java-11-openjdk-amd64/bin/javac

> **Hinweis:** Passe die Pfade an deine installierten Java-Versionen an.

## Beispielausgabe

Nach erfolgreichem Ausführen des Skripts:
echo $JAVA_HOME
