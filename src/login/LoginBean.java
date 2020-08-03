package login;

public class LoginBean {
	private String Username;
	private String Password;
	private String Type;
	private String ProfileID;
	private String LastName;
	private String FirstName;
	private String Gender;
	private String Email;
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getProfileID() {
		return ProfileID;
	}
	public void setProfileID(String profileID) {
		ProfileID = profileID;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	@Override
	public String toString() {
		return "LoginBean [Username=" + Username + ", Password=" + Password + ", Type=" + Type + ", ProfileID="
				+ ProfileID + ", LastName=" + LastName + ", FirstName=" + FirstName + ", Gender=" + Gender + ", Email="
				+ Email + "]";
	}
	
	
	
}
