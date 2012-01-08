package sg.edu.nus.iss.vms.web.security;

import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.List;

import net.sf.navigator.menu.MenuComponent;
import net.sf.navigator.menu.PermissionsAdapter;

public class MenuPermissionsAdapter implements PermissionsAdapter {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MenuPermissionsAdapter.class);

	private ArrayList<String> allowedMenus;

	public MenuPermissionsAdapter(List<String> allowedMenus2) {
		super();
		this.allowedMenus = (ArrayList<String>) allowedMenus2;
	}

	@Override
	public boolean isAllowed(MenuComponent menu) {
		if (logger.isDebugEnabled()) {
			logger.debug("isAllowed(MenuComponent) - start"); //$NON-NLS-1$
		}
		//checking for parent menu existence. If the menu object passed in is a parent, this loop will end with no result.
		for (String dbmenu : allowedMenus) {
			logger.debug("checking for " + menu.getTitle() + " checking against " + dbmenu);
			if (dbmenu.equals(menu.getTitle())) {
				if (logger.isDebugEnabled()) {
					logger.debug("isAllowed(MenuComponent) - end"); //$NON-NLS-1$
				}
				return true;
			}

		}
		//the above loop has completed with no results. Lets check if there is at least 1 child menu that the user can see. if one child menu is matching, the parent should show as well.
		MenuComponent[] childMenus = menu.getMenuComponents();
		for (String dbmenu : allowedMenus) {
			if (childMenus != null && childMenus.length > 0) {
				// check for child menus
				for (MenuComponent childMenu : childMenus) {
					logger.debug("checking for child menu " + childMenu.getTitle() + " checking against " + dbmenu);
					if (dbmenu.equals(childMenu.getTitle())) {
						if (logger.isDebugEnabled()) {
							logger.debug("isAllowed(MenuComponent) - end"); //$NON-NLS-1$
						}
						return true;
					}
				}
			}
		}
		if (logger.isDebugEnabled()) {
			logger.debug("isAllowed(MenuComponent) - end"); //$NON-NLS-1$
		}
		return false;
	}

}