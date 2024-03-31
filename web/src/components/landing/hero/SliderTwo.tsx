import Button from "@/components/common/Button";
import Image from "next/image";
import image from "../../../../public/hero/image-2.png";

const SliderTwo = () => {
  return (
    <div className="w-full md:h-[860px] bg-surfaceContainerLow md:px-[160px] md:pt-large flex flex-col-reverse md:flex-row overflow-hidden justify-between">
      <div className="flex flex-col gap-y-large md:gap-y-v-large justify-center items-start md:w-[800px]">
        <div className="flex flex-col gap-y-small md:gap-y-x-small">
          <p className="prose-title-medium md:prose-headline-small text-onPrimaryContainer ">
            Discover Limitless Style
          </p>
          <p className=" text-onPrimaryContainer font-bold font-Roboto text-[35px] md:text-[80px]">
            FASHION{" "}
            <span className="text-primary font-bold text-[35px] md:text-[80px]">
              HEAVEN
            </span>{" "}
          </p>
          <p className="prose-title-medium md:prose-title-large text-secondary ">
            Indulge in Endless Style Possibilities at StyleHub Fashion Haven,
            where curated collections and trendsetting designs await to elevate
            your wardrobe.
          </p>
        </div>

        <Button
          label={"EXPLORE NOW".toLocaleUpperCase()}
          color="text-onPrimary"
          backgroundColor="bg-primary"
        />
      </div>
      <div className="w-[400px] md:w-auto h-[390px] pr-24 flex items-center md:w-grow pb-5 md:p-0 md:h-[840px]">
        <Image
          src={image}
          alt="slider"
          className="object-fill h-full w-full"
        />
      </div>
    </div>
  );
};

export default SliderTwo;