package com.greenbean.feature.product.controller;

import com.greenbean.feature.product.model.Product;
import com.greenbean.feature.product.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by Donald Huang
 * @author Zhongxu Huang
 */

@RestController
@CrossOrigin
@RequestMapping("/admin")
public class ProductController {

    private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
    @Autowired
    private ProductService productService;

    @GetMapping("/product")
    public ResponseEntity<List<Product>> getAllProducts() {
        logger.info("Forwarding request to Product service layer");
        List<Product> products = this.productService.getAllProducts();
        logger.info("Returning response");
        return new ResponseEntity<>(products, HttpStatus.OK);
    }

}
