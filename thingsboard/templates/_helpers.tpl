{{/*
Expand the name of the chart.
*/}}
{{- define "thingsboard.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "thingsboard.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create unified labels for thingsboard components
*/}}
{{- define "thingsboard.common.matchLabels" -}}
app: {{ template "thingsboard.name" . }}
release: {{ .Release.Name }}
{{- end -}}

{{- define "thingsboard.common.metaLabels" -}}
chart: {{ template "thingsboard.chart" . }}
heritage: {{ .Release.Service }}
{{- end -}}

{{- define "thingsboard.setup.labels" -}}
component: "setup"
{{ include "thingsboard.common.matchLabels" . }}
{{ include "thingsboard.common.metaLabels" . }}
{{- end -}}

{{- define "thingsboard.node.labels" -}}
{{ include "thingsboard.node.matchLabels" . }}
{{ include "thingsboard.common.metaLabels" . }}
{{- end -}}

{{- define "thingsboard.node.matchLabels" -}}
component: {{ .Values.node.name | quote }}
{{ include "thingsboard.common.matchLabels" . }}
{{- end -}}

{{- define "thingsboard.web.labels" -}}
{{ include "thingsboard.web.matchLabels" . }}
{{ include "thingsboard.common.metaLabels" . }}
{{- end -}}

{{- define "thingsboard.web.matchLabels" -}}
component: {{ .Values.web.name | quote }}
{{ include "thingsboard.common.matchLabels" . }}
{{- end -}}

{{- define "thingsboard.js.labels" -}}
{{ include "thingsboard.js.matchLabels" . }}
{{ include "thingsboard.common.metaLabels" . }}
{{- end -}}

{{- define "thingsboard.js.matchLabels" -}}
component: {{ .Values.js.name | quote }}
{{ include "thingsboard.common.matchLabels" . }}
{{- end -}}

{{- define "thingsboard.transport.http.labels" -}}
{{ include "thingsboard.transport.http.matchLabels" . }}
{{ include "thingsboard.common.metaLabels" . }}
{{- end -}}

{{- define "thingsboard.transport.http.matchLabels" -}}
component: {{ .Values.transport.http.name | quote }}
{{ include "thingsboard.common.matchLabels" . }}
{{- end -}}

{{- define "thingsboard.transport.mqtt.labels" -}}
{{ include "thingsboard.transport.mqtt.matchLabels" . }}
{{ include "thingsboard.common.metaLabels" . }}
{{- end -}}

{{- define "thingsboard.transport.mqtt.matchLabels" -}}
component: {{ .Values.transport.mqtt.name | quote }}
{{ include "thingsboard.common.matchLabels" . }}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "thingsboard.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified tb-node name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "thingsboard.node.fullname" -}}
{{- if .Values.node.fullnameOverride -}}
    {{- .Values.node.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- if contains $name .Release.Name -}}
        {{- printf "%s-%s" .Release.Name .Values.node.name | trunc 63 | trimSuffix "-" -}}
    {{- else -}}
        {{- printf "%s-%s-%s" .Release.Name $name .Values.node.name | trunc 63 | trimSuffix "-" -}}
    {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified setup name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "thingsboard.setup.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-setup" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-setup" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified tb-js-executor name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "thingsboard.js.fullname" -}}
{{- if .Values.js.fullnameOverride -}}
{{- .Values.js.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.js.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.js.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified tb-web-ui name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "thingsboard.web.fullname" -}}
{{- if .Values.web.fullnameOverride -}}
{{- .Values.web.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.web.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.web.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified tb-http-transport name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "thingsboard.transport.http.fullname" -}}
{{- if .Values.transport.http.fullnameOverride -}}
{{- .Values.transport.http.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.transport.http.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.transport.http.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified tb-mqtt-transport name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "thingsboard.transport.mqtt.fullname" -}}
{{- if .Values.transport.mqtt.fullnameOverride -}}
{{- .Values.transport.mqtt.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.transport.mqtt.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.transport.mqtt.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use for the node component
*/}}
{{- define "thingsboard.node.serviceAccount.name" -}}
{{- if .Values.node.serviceAccount.create -}}
    {{ default (include "thingsboard.node.fullname" .) .Values.node.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.node.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use for the web component
*/}}
{{- define "thingsboard.web.serviceAccount.name" -}}
{{- if .Values.web.serviceAccount.create -}}
    {{ default (include "thingsboard.web.fullname" .) .Values.web.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.web.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use for the js component
*/}}
{{- define "thingsboard.js.serviceAccount.name" -}}
{{- if .Values.js.serviceAccount.create -}}
    {{ default (include "thingsboard.js.fullname" .) .Values.js.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.js.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use for the http transport component
*/}}
{{- define "thingsboard.transport.http.serviceAccount.name" -}}
{{- if .Values.transport.http.serviceAccount.create -}}
    {{ default (include "thingsboard.transport.http.fullname" .) .Values.transport.http.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.transport.http.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use for the mqtt transport component
*/}}
{{- define "thingsboard.transport.mqtt.serviceAccount.name" -}}
{{- if .Values.transport.mqtt.serviceAccount.create -}}
    {{ default (include "thingsboard.transport.mqtt.fullname" .) .Values.transport.mqtt.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.transport.mqtt.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Define the thingsboard.namespace template
*/}}
{{- define "thingsboard.namespace" -}}
{{ printf "namespace: %s" .Release.Namespace }}
{{- end -}}
