import { Button, Text } from "@radix-ui/themes";
import Image from "next/image";
import image from "../../public/hero/Image-2.png";

const Hero = () => {
  return (
    <div className="bg-surfaceContainerLow">
      <div className="w-full flex flex-row justify-between lg:container max-h-screen">
        <div className="hidden md:w-[40%] md:block">
          <Image src={image} alt="slider" />
        </div>
        <div className="md:w-[45%] w-[70%] flex flex-col justify-center mx-auto md:justify-center items-center md:items-start justify-self-start">
          <div className="flex flex-col pb-10">
            <p className=" text-black ">Discover Limitless Style</p>
            <p className=" text-black font-bold font-Roboto text-6xl">
              FASHION{" "}
              <span className="text-primary font-bold text-6xl">HEAVEN</span>{" "}
            </p>
            <Text className="text-justify text-secondary w-[85%] pt-4">
              Indulge in Endless Style Possibilities at StyleHub Fashion Haven,
              where curated collections and trendsetting designs await to
              elevate your wardrobe.
            </Text>
          </div>
          <Button color="pink" size={"3"} className="p-2">
            Explore Now
          </Button>
        </div>
      </div>
    </div>
  );
};

export default Hero;
