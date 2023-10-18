package com.app.alltt.support.dto;

import org.springframework.stereotype.Component;

@Component
public class PlatformDTO {
	
	private int platformId;
	private int platformCostBasic;
	private int platformCostStandard;
	private int platformCostPremium;
	public int getPlatformId() {
		return platformId;
	}
	public void setPlatformId(int platformId) {
		this.platformId = platformId;
	}
	public int getPlatformCostBasic() {
		return platformCostBasic;
	}
	public void setPlatformCostBasic(int platformCostBasic) {
		this.platformCostBasic = platformCostBasic;
	}
	public int getPlatformCostStandard() {
		return platformCostStandard;
	}
	public void setPlatformCostStandard(int platformCostStandard) {
		this.platformCostStandard = platformCostStandard;
	}
	public int getPlatformCostPremium() {
		return platformCostPremium;
	}
	public void setPlatformCostPremium(int platformCostPremium) {
		this.platformCostPremium = platformCostPremium;
	}
	@Override
	public String toString() {
		return "PlatformDTO [platformId=" + platformId + ", platformCostBasic=" + platformCostBasic
				+ ", platformCostStandard=" + platformCostStandard + ", platformCostPremium=" + platformCostPremium
				+ "]";
	}
}
