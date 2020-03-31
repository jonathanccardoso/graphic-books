<div id="messageForm" class="alert alert-success alert-dismissable">			 
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
        ×
    </button>
    <h4>
        Alert!
    </h4> <strong>Warning!</strong> Best check yo self, you're not looking too good. <a href="#" class="alert-link">alert link</a>
</div>

<g:formRemote name="formBook" url="[controller: 'book', action:'save']" update="messageForm">
    <div class="form-group">
        <label for="exampleInputEmail1">
            Email address
        </label>
        <input type="email" class="form-control" id="exampleInputEmail1">
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">
            Password
        </label>
        <input type="password" class="form-control" id="exampleInputPassword1">
    </div>
    <div class="form-group">
        <label for="exampleInputFile">
            File input
        </label>
        <input type="file" class="form-control-file" id="exampleInputFile">
        <p class="help-block">
            Example block-level help text here.
        </p>
    </div>
    <button type="submit" class="btn btn-primary">
        Submit
    </button>
    <input type="hidden" name="id" value="" />
</g:formRemote>
