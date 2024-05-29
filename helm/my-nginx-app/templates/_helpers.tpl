{{- define "my-nginx-app.configmap-checksum" -}}
{{- $cm := include "my-nginx-app.configmap" . | b64enc -}}
{{- $sum := sha256sum $cm -}}
{{- $sum -}}
{{- end -}}