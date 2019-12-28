#!/bin/bash
INGRESSGATEWAY=istio-ingressgateway
IP_ADDRESS="$(minikube ip):$(kubectl get svc $INGRESSGATEWAY --namespace istio-system --output 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')"

while true
do curl -H "Host: eventinghello.kafka.example.com" $IP_ADDRESS
sleep .3
echo
done