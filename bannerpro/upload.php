<?php
$ds = DIRECTORY_SEPARATOR;
$storeFolder = 'uploads';
if (!empty($_FILES)) {
    $tempFile = $_FILES['file']['tmp_name'];            
    $targetPath = dirname( __FILE__ ) . $ds. $storeFolder . $ds;
    $targetFile =  $targetPath. $_FILES['file']['name'];
    move_uploaded_file($tempFile,$targetFile);
    $out1 = shell_exec("./commands.sh $targetFile 2>&1");
    echo $out1;
}
?>    
