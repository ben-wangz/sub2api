{{/*
Chart name
*/}}
{{- define "sub2api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Fullname
*/}}
{{- define "sub2api.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- include "common.names.fullname" . -}}
{{- end -}}
{{- end -}}

{{/*
Standard labels
*/}}
{{- define "sub2api.labels" -}}
{{- include "common.labels.standard" . -}}
{{- end -}}

{{/*
Env ConfigMap name
*/}}
{{- define "sub2api.envConfigMapName" -}}
{{- if .Values.secrets.existingConfigMap -}}
{{- .Values.secrets.existingConfigMap -}}
{{- else -}}
{{- printf "%s-env" (include "sub2api.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Env Secret name
*/}}
{{- define "sub2api.envSecretName" -}}
{{- if .Values.secrets.existingSecret -}}
{{- .Values.secrets.existingSecret -}}
{{- else -}}
{{- printf "%s-sub2api-secrets" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*
Data PVC name
*/}}
{{- define "sub2api.dataPvcName" -}}
{{- if .Values.persistence.existingClaim -}}
{{- .Values.persistence.existingClaim -}}
{{- else -}}
{{- printf "%s-data" (include "sub2api.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
PostgreSQL host (default to Bitnami subchart service name)
*/}}
{{- define "sub2api.databaseHost" -}}
{{- if .Values.database.host -}}
{{- .Values.database.host -}}
{{- else if .Values.postgresql.enabled -}}
{{- printf "%s-postgresql" .Release.Name -}}
{{- else -}}
{{- "" -}}
{{- end -}}
{{- end -}}

{{/*
Redis host (default to Bitnami subchart master service name)
*/}}
{{- define "sub2api.cacheHost" -}}
{{- if .Values.cache.host -}}
{{- .Values.cache.host -}}
{{- else if .Values.redis.enabled -}}
{{- printf "%s-redis-master" .Release.Name -}}
{{- else -}}
{{- "" -}}
{{- end -}}
{{- end -}}
