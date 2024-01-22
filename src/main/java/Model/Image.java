package Model;

public class Image {
	private String imageId;
	private String imageFileName;
	public Image(String imageId, String imageFileName) {
		super();
		this.imageId = imageId;
		this.imageFileName = imageFileName;
	}
	
	public Image(String imageFileName) {
		super();
		this.imageFileName = imageFileName;
	}

	public Image() {
		super();
	}
	public String getImageId() {
		return imageId;
	}
	public void setImageId(String imageId) {
		this.imageId = imageId;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	
}
