import Button from "@/components/common/Button";
import Image from "next/image";
import image from "../../../../public/banner/banner-sliders-2.png";
export default function SlideTwo() {
  return (
    <div className="flex flex-col md:flex-row w-full md:h-[800px] md:box-border md:px-[200px] py-small md:py-xx-large md:overflow-hidden bg-[#FFFDEC] md:justify-between">
      <div className="flex flex-col gap-y-small md:gap-y-xx-large text-center md:text-start justify-center items-center md:items-start md:w-[800px]">
        <div>
          <p className="prose-display-small-bold md:prose-display-large-bold inline text-onPrimaryContainer">
            Empower Your Style: Unlock Your{" "}
            <span className="text-primary md:prose-display-large-bold">
              Best Look
            </span>{" "}
            with Us
          </p>
        </div>

        <p className="prose-title-medium md:prose-headline-small text-secondary">
          Elevate Your Wardrobe: Explore the Latest Fashion Trends and Must-Have
          Styles! Explore Now on StyleHub.
        </p>
        <Button
          label={"VIEW ALL".toLocaleUpperCase()}
          color="text-onPrimary"
          backgroundColor="bg-primary"
        />
      </div>
      <Image
        src={image}
        className="hidden md:flex w-[530px] h-[750px]"
        alt="banner slider image"
      />
    </div>
  );
}
