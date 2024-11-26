{{/*
Expand the name of the chart.
*/}}
{{- define "matverseny-backend-postgres.name" -}}
{{- print (default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-") "-postgres" }}
{{- end }}

{{- define "matverseny-backend-postgres.username" -}}
{{- print "matverseny-backend" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "matverseny-backend-postgres.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- print (default .Chart.Name .Values.nameOverride) "-postgres" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "matverseny-backend-postgres.chart" -}}
{{- printf "%s-postgres-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "matverseny-backend-postgres.labels" -}}
helm.sh/chart: {{ include "matverseny-backend-postgres.chart" . }}
{{ include "matverseny-backend-postgres.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "matverseny-backend-postgres.selectorLabels" -}}
app.kubernetes.io/name: {{ include "matverseny-backend-postgres.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


