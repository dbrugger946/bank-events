package org.kie.kogito.app;

import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.kie.kogito.conf.ConfigBean;
import org.kie.kogito.event.cloudevents.CloudEventMeta;
import org.kie.kogito.event.EventKind;

public class DecisionCloudEventMetaFactory {

    @javax.inject.Inject()
    ConfigBean config;

    private CloudEventMeta buildCloudEventMeta(String type, String sourceSuffix, EventKind kind) {
        String source = kind == EventKind.PRODUCED ? Stream.of(config.getServiceUrl(), sourceSuffix).filter(s -> s != null && !s.isEmpty()).collect(Collectors.joining("/")) : "";
        return new CloudEventMeta(type, source, kind);
    }

    @javax.enterprise.inject.Produces()
    public CloudEventMeta buildCloudEventMeta_CONSUMED_DecisionRequest() {
        return new CloudEventMeta("DecisionRequest", "", EventKind.CONSUMED);
    }

    @javax.enterprise.inject.Produces()
    public CloudEventMeta buildCloudEventMeta_PRODUCED_DecisionResponseError_UnknownModel() {
        String source = Optional.of(config.getServiceUrl()).filter(s -> s != null && !s.isEmpty()).orElse("__UNKNOWN_SOURCE__");
        return new CloudEventMeta("DecisionResponseError", source, EventKind.PRODUCED);
    }

    @javax.enterprise.inject.Produces()
    public CloudEventMeta buildCloudEventMeta_PRODUCED_PRODUCED_DecisionResponse_Personalization() {
        return buildCloudEventMeta("DecisionResponse", "Personalization", org.kie.kogito.event.EventKind.PRODUCED);
    }

    @javax.enterprise.inject.Produces()
    public CloudEventMeta buildCloudEventMeta_PRODUCED_PRODUCED_DecisionResponseFull_Personalization() {
        return buildCloudEventMeta("DecisionResponseFull", "Personalization", org.kie.kogito.event.EventKind.PRODUCED);
    }

    @javax.enterprise.inject.Produces()
    public CloudEventMeta buildCloudEventMeta_PRODUCED_PRODUCED_DecisionResponseError_Personalization() {
        return buildCloudEventMeta("DecisionResponseError", "Personalization", org.kie.kogito.event.EventKind.PRODUCED);
    }
}
