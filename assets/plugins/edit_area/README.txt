/**
 * @name       EditArea Plugin for MODx
 * @purpose    Replaces standard textarea with EditArea (c) C.Dolivet
 * @status     GA
 * @version    0.5.2 - March 17, 2010
 * @EditArea   Packaged version: 0.8.2
 *
 * @required   MODx      0.9.6.3+
 *             EditArea  0.8.2
 *
 * @confirmed  MODx      Evolution 1.0.2
 *
 * @author     pixelchutes  <http://www.pixelchutes.com>
 *             Gildas       <modx@ackwa.fr>
 *
 * @see        http://www.cdolivet.com/index.php?page=editArea
 *
 * @install    See README.txt
 * @history    See plugin_history.txt
 * @todo       See plugin_todo.txt
 * @bugs       See plugin_bugs.txt
 */

INSTALLATION
------------

    - Extract the downloaded archive to your MODx base directory

        NOTE: If needed, chmod 755 for folders and chmod 644 for *.*

	- Run the installer by navigating to http://domain.com/install/

CORE HACKS (optional)
----------
    - If you want to use EditArea to view and Edit file in the FileManager, you need to follow these steps :
    
    1 - To invoke a new "virtual" event add these lines at the beginning of manager/includes/footer.inc.php  :

           // Ackwa Hack : Create & Invoke a virtual "OnManagerPageRender" event
           $modx->pluginEvent['OnManagerPageRender'] = array('EditArea');
           $out = $modx->invokeEvent("OnManagerPageRender", array('action' => (isset($action) ? ($action + 0) : 0)));
           if (isset($out) && is_array($out)) echo implode('', $out);

    2 - Then because Javascript submit() bypass the "onsubmit" handler, you need to modify manager/actions/file.dynamic.php.
      - Add this line just before the </form> (line 552)
    
           <input type="submit" name="save" style="display:none">

      - Modify the "onclick" handler of the save link (ie. Button1 - line 559) to replace :
    
           document.editFile.submit(); 
    
        by :
    
           document.editFile.save.click();


NOTES
-----
    - Additional Notes/To Do/Change Log/etc can be found in /assets/plugins/edit_area/core
