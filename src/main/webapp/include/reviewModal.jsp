<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Modal -->
<style>
	.margin-bottom {
		margin-bottom:15px;
	}
</style>
<div class="modal contact-modal fade" id="review-modal"
	data-backdrop="false" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true" style="z-index:100000">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" >
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">후기 등록</h4>
			</div>
			<form role="form" action="${ pageContext.request.contextPath}/user/registerReview.cr" method="POST">
				<div class="modal-body">
					<div class="form-group margin-bottom">
						<label class="col-md-4" for="name">청결도</label>
						<input type="hidden" id="modalUserNO" name="userNo">
						<input type="hidden" id="modalhotelNO" name="hotelNo">
						<div class="col-md-8">
							<select id="cleanliness" name="cleanliness" class="form-control">
								<option value="">평점 선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</div>
					</div>
					<div class="form-group margin-bottom">
						<label class="col-md-4 " for="name">편안함</label>
						<div class="col-md-8">
							<select id="comfort" name="comfort" class="form-control">
								<option value="">평점 선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</div>
					</div>
					<div class="form-group margin-bottom">
						<label class="col-md-4 " for="name">교통 편의</label>
						<div class="col-md-8">
							<select id="location1" name="location" class="form-control">
								<option value="">평점 선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</div>
					</div> 
					<div class="form-group margin-bottom">
						<label class="col-md-4 " for="name">부대 시설</label>
						<div class="col-md-8">
							<select id="facilities" name="facilities" class="form-control">
								<option value="">평점 선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</div>
					</div>
					<div class="form-group margin-bottom">
						<label class="col-md-4 " for="name">직원 친절도</label>
						<div class="col-md-8" class="form-control">
							<select id="staff" name="staff" >
								<option value="">평점 선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</div>
					</div>
					<div class="form-group text-center" style="margin-top:15px">
						<button type="submit" class="btn btn-success btn-submit">후기
							등록</button>
						<button type="button" class="btn btn-default btn-cancel"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			
			</form>
		</div>
	</div>
</div>