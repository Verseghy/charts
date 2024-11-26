{{/*
Expand the name of the chart.
*/}}
{{- define "matverseny-backend-migration.name" -}}
{{- print (default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-") "-migration" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "matverseny-backend-migration.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- print (default .Chart.Name .Values.nameOverride) "-migration" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "matverseny-backend-migration.chart" -}}
{{- printf "%s-migration-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "matverseny-backend-migration.labels" -}}
helm.sh/chart: {{ include "matverseny-backend-migration.chart" . }}
{{ include "matverseny-backend-migration.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "matverseny-backend-migration.selectorLabels" -}}
app.kubernetes.io/name: {{ include "matverseny-backend-migration.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "matverseny-backend-migration.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "matverseny-backend-migration.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
