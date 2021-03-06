# https://cloud.google.com/bigquery/docs/reference/v2/jobs

module BigQuery
  class Client
    module Jobs
      # Fetches a bigquery job by id
      #
      # @param id [Integer] job id to fetch
      # @param options [Hash] bigquery opts accepted
      # @return [Hash] json api response
      def job(id, opts = {})
        opts['jobId'] ||= id

        api(api_method: @bq.jobs.get,
            parameters: opts)
      end

      # lists all the jobs
      #
      # @param options [Hash] bigquery opts accepted
      # @return [Hash] json api response
      def jobs(opts = {})
        api(api_method: @bq.jobs.list,
            parameters: opts)
      end

      # Gets the results of a given job
      #
      # @param id [Integer] job id to fetch
      # @param options [Hash] bigquery opts accepted
      # @return [Hash] json api response
      def get_query_results(id, opts = {})
        opts['jobId'] ||= id

        api(api_method: @bq.jobs.get_query_results,
            parameters: opts)
      end

      # Insert a job
      #
      # @param options [Hash] hash of job options
      # @param parameters [Hash] hash of parameters (uploadType, etc.)
      # @param media [Google::APIClient::UploadIO] media upload
      # @return [Hash] json api response
      def insert_job(opts, parameters = {}, media = nil)
        api(api_method: @bq.jobs.insert,
            parameters: parameters,
            body_object: {configuration: opts},
            media: media)
      end
    end
  end
end
