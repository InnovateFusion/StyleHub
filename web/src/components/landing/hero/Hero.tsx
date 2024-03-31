"use client";

// import { useState, useEffect } from "react";
import SliderOne from "./SliderOne";
import SliderTwo from "./SliderTwo";
import SliderThree from "./SliderThree";

const Hero = () => {
  // const [currentImageIndex, setCurrentImageIndex] = useState(0);

  // useEffect(() => {
  //   const interval = setInterval(() => {
  //     setCurrentImageIndex((prevIndex) => (prevIndex + 1) % 3);
  //   }, 3000);

  //   return () => clearInterval(interval);
  // }, []);

  return (
    <div className="w-full md:h-[860px] bg-surfaceContainerLow p-3 md:p-0 md:px-[160px] md:pt-large flex flex-row overflow-hidden justify-between">
      <SliderOne />
      {/* {currentImageIndex === 0 && <SliderOne />} */}
      {/* {currentImageIndex === 1 && <SliderTwo />} */}
      {/* {currentImageIndex === 2 && <SliderThree />} */}
    </div>
  );
};

export default Hero;
