---
title: "{{ replace .Name "-" " " | title }}"
author: monaco
date: {{ .Date }}
slug: {{ now.Format "2006-01-02" }}-{{ .Name | urlize }}
type: posts
categories:
  - default
tags:
  - default
---
