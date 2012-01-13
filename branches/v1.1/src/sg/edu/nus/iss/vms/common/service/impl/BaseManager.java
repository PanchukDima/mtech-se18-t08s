package sg.edu.nus.iss.vms.common.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;

import sg.edu.nus.iss.vms.common.dao.Dao;
import sg.edu.nus.iss.vms.common.dto.BaseVersionDto;
import sg.edu.nus.iss.vms.common.orm.Manager;
import sg.edu.nus.iss.vms.common.orm.QueryProperties;
import sg.edu.nus.iss.vms.common.web.util.UserUtil;

/**
 * Base class for Business Services Use this class for utility methods and
 * generic CRUD methods.
 * 
 * @author zaw.htet
 * @version $Revision$
 */
public class BaseManager implements Manager {

        protected final Logger log = Logger.getLogger(BaseManager.class);
        protected static final QueryProperties DEFAULT_QUERY_PROPERTIES = new QueryProperties();
        protected Dao dao = null;

        public BaseManager() {
                // none
        }

        /**
         * @see sg.edu.nus.iss.vms.common.orm.service.Manager#setDao(sg.edu.nus.iss.vms.common.dao.Dao)
         */
        @Override
        public void setDao(Dao dao) {
                this.dao = dao;
        }

        /**
         * @see sg.edu.nus.iss.vms.common.orm.service.Manager#list(java.lang.Class)
         */
        @Override
        public List list(Class type) {
                return dao.getObjects(type, (QueryProperties) null);
        }

        /**
         * @see sg.edu.nus.iss.vms.common.orm.service.Manager#list(java.lang.Class,
         *      sg.edu.nus.iss.vms.common.orm.service.QueryProperties)
         */
        @Override
        public List list(Class type, QueryProperties properties) {
                return dao.getObjects(type, properties);
        }

        /**
         * @see sg.edu.nus.iss.vms.common.orm.service.Manager#list(java.lang.Class,
         *      java.io.Serializable, int, int)
         */
        @Override
        public List list(Class type, Object example, QueryProperties properties) {
                return dao.getObjects(type, example, properties);
        }

        /**
         * @see sg.edu.nus.iss.vms.common.orm.service.Manager#list(java.io.Serializable)
         */
        @Override
        public List list(Class type, Object example) {
                return dao.getObjects(type, example, (QueryProperties) null);
        }

        /**
         * @see sg.edu.nus.iss.vms.common.orm.service.service.Manager#find(java.io.Serializable)
         */
        @Override
        public List find(Class type, Object example) {
                return dao.getObjects(type, example, new QueryProperties().setMatchAllExampleFields(false).setMatchStringAnywhere().setIgnoreCase(true));
        }

        /**
         * @see sg.edu.nus.iss.vms.common.orm.service.Manager#find(java.lang.Class,
         *      java.lang.Object,
         *      sg.edu.nus.iss.vms.common.orm.service.QueryProperties)
         */
        @Override
        public List find(Class type, Object example, QueryProperties properties) {
                if (properties == null) {
                        properties = new QueryProperties().setMatchAllExampleFields(false).setMatchStringAnywhere().setIgnoreCase(true);
                }
                return dao.getObjects(type, example, properties);
        }

        /**
         * 
         * @param queryString
         * @return
         */
        @Override
        public List find(String queryString) {
                return dao.getObjects(queryString, (Object[]) null,
                        DEFAULT_QUERY_PROPERTIES);
        }

        /**
         * 
         * @param queryString
         * @param value
         * @return
         */
        @Override
        public List find(String queryString, Object value) {
                return dao.getObjects(queryString, new Object[]{value},
                        DEFAULT_QUERY_PROPERTIES);
        }

        /**
         * 
         * @param queryString
         * @param values
         * @return
         */
        @Override
        public List find(String queryString, Object[] values) {
                return dao.getObjects(queryString, values, DEFAULT_QUERY_PROPERTIES);
        }

        /**
         * @see sg.edu.nus.iss.vms.common.orm.service.Manager#find(java.lang.String,
         *      java.lang.Object[],
         *      sg.edu.nus.iss.vms.common.orm.service.QueryProperties)
         */
        @Override
        public List find(String queryString, Object[] values,
                QueryProperties properties) {
                return dao.getObjects(queryString, values, properties);
        }

        /**
         * @see sg.edu.nus.iss.vms.common.orm.service.Manager#get(java.lang.Class,
         *      java.io.Serializable)
         */
        @Override
        public Object get(Class type, Serializable id) {
                return dao.getObject(type, id);
        }
                
        /**
         * @see sg.edu.nus.iss.vms.common.orm.service.Manager#save(java.lang.Object)
         */
        @Override
        public void save(Object o) {
                if (o instanceof BaseVersionDto) {
                        BaseVersionDto dto = (BaseVersionDto) o;
                        if (dto.getCreatedBy() == null && UserUtil.getUserSessionInfoVo().getUserID() != null) {
                                dto.setCreatedBy(UserUtil.getUserSessionInfoVo().getUserID());
                        }
                        if (dto.getCreatedDte() == null) {
                                dto.setCreatedDte(new java.util.Date());
                        }
                        if(UserUtil.getUserSessionInfoVo() !=null){
                                dto.setUpdBy(UserUtil.getUserSessionInfoVo().getUserID());
                        }
                        dto.setUpdDte(new java.util.Date());                        
                        dto.updateVersion();
                        
                        dao.saveObject(dto);
                } else {
                        dao.saveObject(o);
                }
        }

        /**
         * @see sg.edu.nus.iss.vms.common.orm.service.Manager#remove(java.lang.Class,
         *      java.io.Serializable)
         */
        @Override
        public void remove(Class type, Serializable id) {
                dao.removeObject(type, id);
        }

        @Override
        public void removeObjects(String query) {
                dao.removeObjects(query);
        }

        @Override
        public List findByNamedQuery(String namedQuery, HashMap values,
                QueryProperties properties) {

                return dao.getObjectsByNamedQuery(namedQuery, values, properties);
        }

        @Override
        public List findByDetachedCriteria(DetachedCriteria criteria) {

                return dao.getObjectbyCriterion(criteria);
        }
}