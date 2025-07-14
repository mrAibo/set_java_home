#!/bin/bash

# Setze JAVA_HOME nur, wenn es noch nicht definiert ist
if [ -z "$JAVA_HOME" ]; then
    JAVA_PATH=$(readlink -f "$(which java 2>/dev/null)" 2>/dev/null)
    if [ -n "$JAVA_PATH" ]; then
        JAVA_HOME=$(dirname "$(dirname "$(dirname "$JAVA_PATH")")")
        # Prüfe, ob das ermittelte Verzeichnis existiert
        if [ ! -d "$JAVA_HOME" ]; then
            JAVA_HOME=""
        fi
    else
        JAVA_HOME=""
    fi
    export JAVA_HOME
fi

# Füge JAVA_HOME/bin zum PATH hinzu, entferne vorherige java-Einträge
if [ -n "$JAVA_HOME" ]; then
    export PATH="$(printf '%s' "$PATH" | tr ':' '\n' | grep -Fv '/java-' | paste -s -d ':'):$JAVA_HOME/bin"
fi
