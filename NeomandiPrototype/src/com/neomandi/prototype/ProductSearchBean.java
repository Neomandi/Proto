package com.neomandi.prototype;

public class ProductSearchBean {
private String category;
private String produce;
private String grade;
private String slot;
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public String getProduce() {
	return produce;
}
public void setProduce(String produce) {
	this.produce = produce;
}
public String getGrade() {
	return grade;
}
public void setGrade(String grade) {
	this.grade = grade;
}
public String getSlot() {
	return slot;
}
public void setSlot(String slot) {
	this.slot = slot;
}
@Override
public String toString() {
	return "ProductSearchBean [category=" + category + ", produce=" + produce + ", grade=" + grade + ", slot=" + slot
			+ "]";
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((category == null) ? 0 : category.hashCode());
	result = prime * result + ((grade == null) ? 0 : grade.hashCode());
	result = prime * result + ((produce == null) ? 0 : produce.hashCode());
	result = prime * result + ((slot == null) ? 0 : slot.hashCode());
	return result;
}
@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	ProductSearchBean other = (ProductSearchBean) obj;
	if (category == null) {
		if (other.category != null)
			return false;
	} else if (!category.equals(other.category))
		return false;
	if (grade == null) {
		if (other.grade != null)
			return false;
	} else if (!grade.equals(other.grade))
		return false;
	if (produce == null) {
		if (other.produce != null)
			return false;
	} else if (!produce.equals(other.produce))
		return false;
	if (slot == null) {
		if (other.slot != null)
			return false;
	} else if (!slot.equals(other.slot))
		return false;
	return true;
}
}