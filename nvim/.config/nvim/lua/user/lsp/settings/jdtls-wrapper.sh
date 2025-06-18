#!/bin/bash

JAVA_AGENT="$HOME/.m2/repository/org/projectlombok/lombok/1.18.36/lombok-1.18.36.jar"
LAUNCHER_JAR=$(find "$HOME/.local/jdtls/plugins" -name "org.eclipse.equinox.launcher_*.jar" | head -n 1)
CONFIG_DIR="$HOME/.local/jdtls/config_mac"
WORKSPACE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/jdtls-workspace/$(basename "$(pwd)")"
export LOG_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/jdtls.log"

# Ensure all logback/stdout/stderr output goes to the log file.
exec java \
  -javaagent:"$JAVA_AGENT" \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=4 \
  -Dfile.encoding=UTF-8 \
  -Dlogback.configurationFile="$HOME/.local/jdtls/logback.xml" \
  -jar "$LAUNCHER_JAR" \
  -configuration "$CONFIG_DIR" \
  -data "$WORKSPACE_DIR" \
  -log "$LOG_FILE" \
  < /dev/null > "$LOG_FILE" 2>&1
