import Image, { StaticImageData } from "next/image";

interface CategoryProps {
  image: StaticImageData;
  title: string;
}

export default function Category({ image, title}: CategoryProps) {
  return (
    <div
      className={`border-2 border-gray-200 rounded-3xl w-[250px] md:h-[250px] py-large md:py-x-large px-v-large md:px-large flex flex-col gap-y-small items-center justify-center`}
    >
      <Image
        src={image}
        alt={title}
        className="bg-slate-50 rounded-full w-3/4 h-3/4 object-fill"
      />
      <p className="prose-title-large">{title}</p>
    </div>
  );
}
