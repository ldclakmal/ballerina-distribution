import ballerina/file;
import ballerina/log;

// In this example, the listener monitors any modifications done to a specific directory.
// Before running the example, change the value of the 'path' field 
// to indicate the path of the directory that you want the listener to monitor.
// As the recursive property is set to false,
// the listener does not monitor the child directories of the main directory
// that it listens to.
listener file:Listener inFolder = new ({
    path: "/home/ballerina/fs-server-connector/observed-dir",
    recursive: false
});

// The directory listener should have at least one of these predefined resources.
service "localObserver" on inFolder {

    // This function is invoked once a new file is created in the listening directory.
    remote function onCreate(file:FileEvent m) {
        log:printInfo("Create: " + m.name);
    }

    // This function is invoked once an existing file is deleted from the listening directory.
    remote function onDelete(file:FileEvent m) {
        log:printInfo("Delete: " + m.name);
    }

    // This function is invoked once an existing file is modified in the listening directory.
    remote function onModify(file:FileEvent m) {
        log:printInfo("Modify: " + m.name);
    }
}
