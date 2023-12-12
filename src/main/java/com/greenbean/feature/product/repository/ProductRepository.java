package com.greenbean.feature.product.repository;

import com.greenbean.feature.product.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Donald Huang
 */
public interface ProductRepository extends JpaRepository<Product,Long> {

}
