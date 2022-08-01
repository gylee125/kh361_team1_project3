package model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import model.dao.ProductDAO;
import model.dto.ProductDTO;
import model.dto.ProductDetailDTO;

public class ProductService {

    private static ProductService instance = new ProductService();

    public static ProductService getInstance() {
        return instance;
    }

    private ProductService() {

    }

    public List<ProductDTO> showProductList() {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            ProductDAO productDAO = ProductDAO.getInstance();
            return productDAO.selectProductList(conn);
            
        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
        return null;
    }
    
    public List<ProductDTO> showRelatedList(int pId) {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            ProductDAO productDAO = ProductDAO.getInstance();
            return productDAO.showRelatedList(conn, pId);
            
        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
        return null;
    }

    public List<ProductDTO> showProductListByTypeCode(String typeCode) {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            ProductDAO productDAO = ProductDAO.getInstance();
            return productDAO.selectByTypeCode(conn, typeCode);

        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
        return null;
    }
    
    public List<ProductDTO> searchProduct(String keyword) {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            ProductDAO productDAO = ProductDAO.getInstance();
            return productDAO.searchProduct(conn, keyword);

        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
        return null;
    }

    public ProductDTO showProduct(int pId) {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            ProductDAO productDAO = ProductDAO.getInstance();
            return productDAO.selectByPId(conn, pId);

        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
        return null;
    }
    
    public List<ProductDTO> show6Product() {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            ProductDAO productDAO = ProductDAO.getInstance();
            return productDAO.select6ProductList(conn);

        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
        return null;
    }
    
    public ProductDetailDTO showProductDetail(int pId) {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            ProductDAO productDAO = ProductDAO.getInstance();
            return productDAO.selectJoinByPId(conn, pId);

        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
        return null;
    }

    public void insert(ProductDTO product) {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            ProductDAO productDAO = ProductDAO.getInstance();

            productDAO.insert(conn, product);

        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }

    }

}
