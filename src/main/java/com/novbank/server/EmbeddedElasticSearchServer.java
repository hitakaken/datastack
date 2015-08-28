package com.novbank.server;

import org.apache.commons.io.FileUtils;
import org.elasticsearch.client.Client;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.node.Node;

import java.io.File;
import java.io.IOException;

import static org.elasticsearch.node.NodeBuilder.nodeBuilder;

/**
 * Created by hp on 2015/8/28.
 */
public class EmbeddedElasticSearchServer {
    private static final String DEFAULT_DATA_DIRECTORY = "target/elasticsearch-data";

    private final Node node;
    private final String dataDirectory;

    public EmbeddedElasticSearchServer() {
        this(DEFAULT_DATA_DIRECTORY);
    }

    public EmbeddedElasticSearchServer(String dataDirectory) {
        this.dataDirectory = dataDirectory;
        ImmutableSettings.Builder elasticsearchSettings = ImmutableSettings.settingsBuilder()
                .put("http.enabled", "false")
                .put("path.data", dataDirectory);

        node = nodeBuilder()
                .local(true)
                .settings(elasticsearchSettings.build())
                .node();
    }

    public Client getClient() {
        return node.client();
    }

    public void shutdown() {
        node.close();
        deleteDataDirectory();
    }

    private void deleteDataDirectory() {
        try {
            FileUtils.deleteDirectory(new File(dataDirectory));
        } catch (IOException e) {
            throw new RuntimeException("Could not delete data directory of embedded elasticsearch server", e);
        }
    }

    /*private static EmbeddedElasticSearchServer instance;

    public static void main(String[] args){
        start();
    }

    public static void start(){
        if(instance == null){
            instance = new EmbeddedElasticSearchServer();
        }
    }

    public static void stop(){
        if(instance!=null){
            instance.shutdown();
            instance = null;
        }
    }*/
}
