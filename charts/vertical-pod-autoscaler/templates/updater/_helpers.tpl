{{/*
Fullname
*/}}
{{- define "vertical-pod-autoscaler.updater.fullname" -}}
{{ include "vertical-pod-autoscaler.fullname" . }}-updater
{{- end }}

{{/*
Common labels
*/}}
{{- define "vertical-pod-autoscaler.updater.labels" -}}
{{ include "vertical-pod-autoscaler.labels" . }}
app.kubernetes.io/component: updater
{{- end }}

{{/*
Selector labels
*/}}
{{- define "vertical-pod-autoscaler.updater.selectorLabels" -}}
{{ include "vertical-pod-autoscaler.selectorLabels" . }}
app.kubernetes.io/component: updater
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "vertical-pod-autoscaler.updater.serviceAccountName" -}}
{{- if .Values.updater.serviceAccount.create -}}
{{- default (printf "%s-updater" (include "vertical-pod-autoscaler.fullname" .)) .Values.updater.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.updater.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
The image to use
*/}}
{{- define "vertical-pod-autoscaler.updater.image" -}}
{{- printf "%s:%s" .Values.updater.image.repository (default .Chart.AppVersion .Values.updater.image.tag) }}
{{- end }}
