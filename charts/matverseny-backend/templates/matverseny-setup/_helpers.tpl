{{/*
Expand the name of the chart.
*/}}
{{- define "matverseny-backend-setup.name" -}}
{{- print (default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-") "-setup" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "matverseny-backend-setup.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := print (default .Chart.Name .Values.nameOverride) "-setup" }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "matverseny-backend-setup.chart" -}}
{{- printf "%s-setup-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "matverseny-backend-setup.labels" -}}
helm.sh/chart: {{ include "matverseny-backend-setup.chart" . }}
{{ include "matverseny-backend-setup.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "matverseny-backend-setup.selectorLabels" -}}
app.kubernetes.io/name: {{ include "matverseny-backend-setup.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "matverseny-backend-setup.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "matverseny-backend-setup.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
