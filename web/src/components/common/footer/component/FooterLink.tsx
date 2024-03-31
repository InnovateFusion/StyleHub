import Link from "next/link";

interface FooterLinkProps {
  name: string;
  isHeading: boolean;
}

const FooterLink = ({ name, isHeading }: FooterLinkProps) => {
  return (
    <>
      {isHeading ? (
        <p className="text-onPrimary md:prose-headline-small w-full">{name}</p>
      ) : (
        <Link href="#">
          <p className="text-primaryContainer md:prose-body-large prose-body-medium opacity-80 hover:opacity-100 hover:text-primary">
            {name}
          </p>
        </Link>
      )}
    </>
  );
};

export default FooterLink;
