{{/*
Expand the name of the chart.
*/}}
{{- define "iam-postgres.name" -}}
{{- print (default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-") "-postgres" }}
{{- end }}

{{- define "iam-postgres.username" -}}
{{- print "iam" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "iam-postgres.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- print (default .Chart.Name .Values.nameOverride) "-postgres" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "iam-postgres.chart" -}}
{{- printf "%s-postgres-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "iam-postgres.labels" -}}
helm.sh/chart: {{ include "iam-postgres.chart" . }}
{{ include "iam-postgres.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "iam-postgres.selectorLabels" -}}
app.kubernetes.io/name: {{ include "iam-postgres.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


