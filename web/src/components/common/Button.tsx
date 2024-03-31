import React from "react";

interface ButtonProps {
  label: string;
  color: string;
  backgroundColor?: string;
}

const Button: React.FC<ButtonProps> = ({ label, color, backgroundColor }) => {
  return (
    <button
      className={`px-large py-small  ${backgroundColor}  rounded-2xl `}
    >
      <p className={`${color} prose-title-medium py-xx-small `}>{label}</p>
    </button>
  );
};

export default Button;
