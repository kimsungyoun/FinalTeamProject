<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<main>
<div class="container">
        <h1>�Խ��� �� ���</h1>
<div class="write-button">
    <a href="${pageContext.request.contextPath}/boards/boardsWrite">�Խ��� �۾���</a>
    <div>�� ���ڵ� ��: ${pDTO.totalRecord}��</div>
</div>
        <ul class="board-list">
            <li>
                <span>��ȣ</span>
                <span>����</span>
                <span>�۾���</span>
                <span>��ȸ��</span>
                <span>�����</span>
            </li>
            <c:forEach var="dto" items="${list}">
                <li>
                    <span>${dto.boardsNo }</span>
                    <span><a href="/home/boards/boardsView/${dto.boardsNo }">${dto.subject }</a></span>
                    <span>${dto.userId }</span>
                    <span>${dto.hit }</span>
                    <span>${dto.writedate }</span>
                </li>
            </c:forEach>
        </ul>

        <div class="page">
		      <ul>
         <!-- ���� ������ -->
         <!-- ������������ 1�̸� prev�� ������ �������̵��� ������, 2�̻��̸� prev�� ������ ������������ �̵�-->
         <c:if test="${pDTO.nowPage == 1}">
            <li>prev</li>
         </c:if>
         <c:if test="${pDTO.nowPage > 1}">
            <li><a href='/home/boards/boardsList?nowPage=${pDTO.nowPage-1}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>prev</a></li>
         </c:if>
         
         <!-- ������ ��ȣ -->
         <!-- var:����, begin:���۰�, end:����, step:������ -->
         <c:forEach var="p" begin="${pDTO.startPageNum}" end="${pDTO.startPageNum+pDTO.onePageNumCount-1}" step="1">
            <c:if test="${p <= pDTO.totalPage}">
               <c:if test="${p == pDTO.nowPage}">
                  <li style="background:yellow"><a href='/home/boards/boardsList?nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>${p}</a></li>
               </c:if>
               <c:if test="${p != pDTO.nowPage}">
                  <li><a href='/home/boards/boardsList?nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>${p}</a></li>
               </c:if>
            </c:if>
         </c:forEach>

         <!-- ���� ������ -->
         <c:if test="${pDTO.nowPage >= pDTO.totalPage}">
            <li>next</li>
         </c:if>
         <c:if test="${pDTO.nowPage < pDTO.totalPage}">
            <li><a href='/home/boards/boardsList?nowPage=${pDTO.nowPage+1}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>next</a></li>
         </c:if>
      </ul>
   </div>
		
        </div>

        <div class="search">
            <form action="/home/boards/boardsList">
                <select name="searchKey" id="">
                    <option value="subject">����</option>
                    <option value="content">�۳���</option>
                    <option value="userid">�۾���</option>
                </select>
                <input type="text" name="searchWord" id="searchWord" />
                <input type="submit" value="Search" />
            </form>
        </div>
   
</main>
    