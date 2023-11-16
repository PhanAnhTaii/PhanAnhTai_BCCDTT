import { useEffect, useState } from "react";
import sliderservice from "../../../services/SliderService";
import { urlImage } from '../../../config';function Slideshow() {
    const [sliders, setSliders] = useState([]);
    useEffect(function () {
        (async function () {
            await sliderservice.getByPosition('slideshow').then(function (result){
                    setSliders(result.data.sliders);
                });
        })();
    }, [])
    return(
    <div id="carouselExample" class="carousel slide">
        <div className="carousel-inner">
            {sliders.map(function (slide, index) {
                if (index === 0) {
                    return (
                        <div className="carousel-item active">
                            <img style={{height:800}}src={urlImage+'slider/'+slide.image} className="d-block w-100" alt={slide.name} />
                        </div>);
                }
                else {
                    return (
                        <div className="carousel-item">
                            <img style={{height:800}}src={urlImage+'slider/'+slide.image} className="d-block w-100" alt={slide.name} />
                        </div>);
                }
            })}

        </div>
        <button className="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span className="carousel-control-prev-icon" aria-hidden="true"></span>
            <span className="visually-hidden">Previous</span>
        </button>
        <button className="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span className="carousel-control-next-icon" aria-hidden="true"></span>
            <span className="visually-hidden">Next</span>
        </button>
    </div>
    );
}
export default Slideshow;