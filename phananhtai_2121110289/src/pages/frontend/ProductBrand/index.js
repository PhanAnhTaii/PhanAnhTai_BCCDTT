import { useState } from "react";
import ListBrand from "../../../layouts/LayoutSite/ListBrand";
import ListCategory from "../../../layouts/LayoutSite/ListCategory";
import { useEffect } from "react";
import ProductItem from "../../../components/frontend/ProductItem";
import brandservice from "../../../services/BrandService";
import { useParams } from "react-router-dom";
import productservice from "../../../services/ProductService";

function ProductBrand() {
    const { slug } = useParams();
    const [limit, setLimit] = useState(4);
    const [products, setProducts] = useState([]);
    const [title, setTitle] = useState("")
        // < script >
        // $(function () {
        //     $('.orderby').change(function () {
        //         $("#form_order").submit();
        //     })
        // })
        // </script >

        useEffect(function () {
            (async function () {
                try {
                    const result_brand = await brandservice.getById(slug);
                    setTitle(result_brand.data.data.name);
                    const brandid = result_brand.data.data.id;
                    const result = await productservice.getProductByBrandId(brandid, limit);
                    setProducts(result.data.products);

                } catch (error) {
                    console.error(error);
                }
            })();
        }, [limit, slug])
    return (
        <section className="maincontent">
            <div className="container-my-4">
                <div className="row">
                    <div className="col-md-3 p-0 my-5 ">
                        <ListCategory />
                        <ListBrand />
                        {/* <div className="nopadding-left">
                            <form className="tree-most" id="form-order" method="get">
                                <div className="orderby-wrapper pull-right">
                                    <label>Sắp xếp</label>
                                    <select className="orderby" name='orderby'>

                                    </select>
                                </div>
                            </form>
                        </div> */}
                    </div>
                    <div className="col-md-9">
                        <h3 className="text-center text-danger my-4">{title}</h3>
                        <div className="row">
                            {products.map(function (product, index) {
                                return <ProductItem product={product} key={index} />
                            })}
                        </div>

                        <div className='row'>
                            <div className='col-12 text-center my-2'>
                                <button className="btn btn-success" onClick={() => setLimit(limit + 4)}>Xem thêm</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div >
        </section>
    );
}


export default ProductBrand;
